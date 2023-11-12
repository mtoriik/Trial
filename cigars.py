import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import matplotlib as mpl

#load in the data as a dataframe - clean the data frame by renaming columns and removing rows with nan
cigar_data_raw = pd.read_csv('~/Downloads/EditedRawData_forNotebook.csv')
cigar_data_raw = cigar_data_raw.rename(columns = {'Northing (x)': 'Northing (y)', 'Easting (y)' : 'Easting (x)'})
cigar_data_raw.dropna(axis = 0)
cigar_data = cigar_data_raw[['Record #', 'Easting (x)', 'Northing (y)', 'Elevation (z)', 'Trend (Delta)']]

#function to calculate deviation from KP heightfor each cigar
def kp(east, north, height):
    kpb = east * (-2.2947 * (10 ** (-3))) + north * (2.6741 * (10 ** (-3))) - 12435.4 #values given by PI
    kp_height = height - kpb
    return kp_height

#print(cigar_data)
elevation_from_kp = cigar_data.apply(lambda row: kp(row['Easting (x)'], row['Northing (y)'], row['Elevation (z)']), axis = 1)
#cigar_data.sort_values('Elevation from KP', ascending = False)
kp_df = cigar_data.copy()
kp_df['Elevation from KP'] = elevation_from_kp.values
kp_df = kp_df.sort_values('Elevation from KP', ascending= False)
# print(kp_df)


#calculate the slope
def quiver_plot(data_frame):
    with plt.style.context('dark_background'):
        fig, ax = plt.subplots(figsize = (10,5), dpi = 150, edgecolor = 'k')  
        cm = mpl.cm.cool
        norm = mpl.colors.Normalize()
        norm.autoscale(data_frame['Elevation from KP'])
        sm = mpl.cm.ScalarMappable(cmap = cm, norm = norm)
        sm.set_array([])
        # cbar = plt.colorbar(mappable = mpl.cm.ScalarMappable(norm = norm, cmap = cmap), orientation = 'vertical', label = 'KP Elevation')
        #cbar.set_label('KP Elevation'),  angles = 'xy', width = .0025, headwidth = 0.025, headlength = 0, cmap ='spring'
        x_data = data_frame['Easting (x)']
        y_data = data_frame['Northing (y)']
        x_angle = np.cos(data_frame['Trend (Delta)'])
        y_angle = np.sin(data_frame['Trend (Delta)'])
        plt.quiver(x_data, y_data , x_angle, y_angle, color = cm(norm(data_frame['Elevation from KP'])), angles = 'xy', width = .0025, headwidth = 0.025, headlength = 0)
        fig.colorbar(sm, ax = ax, label = 'Elevation from KP')
        plt.xlabel('Easting')
        plt.ylabel('Northing')
        plt.title('Directionality of Cigar Structures plotted by KP Elevation')
        plt.show()

def rose_diagrams(data_frame):
    bin_edges = np.arange(-5, 366, 10)
    number_of_cigars, bin_edges = np.histogram(data_frame['Trend (Delta)'], bin_edges)
    number_of_cigars[0] += number_of_cigars[-1]
    half = np.sum(np.split(number_of_cigars[:-1], 2), 0)
    two_halves = np.concatenate([half, half])
    fig = plt.figure(figsize = (16,8))
    ax = fig.add_subplot(122, projection = 'polar')
    ax.bar(np.deg2rad(np.arange(0, 360, 10)), two_halves, width = np.deg2rad(10), bottom = 0.0, color = '0.8', edgecolor = 'k')
    ax.set_theta_zero_location('N')
    ax.set_theta_direction(-1)
    ax.set_thetagrids(np.arange(0,360,10), labels = np.arange(0, 360, 10))
    ax.set_title('Total Rose Diagram of Cigars', y = 1.10, fontsize = 15)
    plt.show()

quiver_plot(kp_df)
rose_diagrams(kp_df)
