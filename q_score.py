import pandas as pd

def return_filtered(i):
    df = pd.read_csv('~/Desktop/DataDiscovery/tester_output' + str(i) + '.csv')
    filtered_df = df[df['Qavg'] >= 0.583]
    final_df = filtered_df.drop(columns = ['Qworst', 'Qbackbone', 'Qsidechain'])
    final_df = final_df[final_df['Name'].str.len() == 1]
    return final_df

for i in range(2):
    q_df = return_filtered(i)
    q_df.to_csv('filtered_tester_output' + str(i) + '.csv')