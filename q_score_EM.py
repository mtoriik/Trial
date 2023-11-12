from chimerax.core.commands import Command, run

def calculate_q():
    command = Command(session)
    model = command.run('open ' + '~/Desktop/DataDiscovery/5osg.pdb')
    map = command.run('open ' + '~/Desktop/DataDiscovery/emd_8343.map')
    command.run('volume #2 level 0.005')
#command.run('hide #!1.2 models')
#command.run('hide #1.3 models')
    command.run('qscore ' + '#1' + ' toVolume ' + '#2' + ' useGui false pointsPerShell 8 shellRadiusStep 0.100 maxShellRadius 2.00 referenceGaussianSigma 0.60 logDetails true outputFile ~/Desktop/DataDiscovery/EM_output1.csv')
    command.run('close #1') #close all models? therefore it'll all be #1 if looping through them?

calculate_q()
