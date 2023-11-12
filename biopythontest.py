from chimerax.core.commands import Command, run
import re

model_list = ['~/Desktop/DataDiscovery/1a9n.pdb', '~/Desktop/DataDiscovery/1av6.pdb' ]
map_list = ['~/Desktop/DataDiscovery/1a9n_phases.mtz', '~/Desktop/DataDiscovery/1av6_phases.mtz']
def calculate_q():
    for i in range(len(model_list)):
        command = Command(session)
        model = command.run('open ' + str(model_list[i]))
        map = command.run('open ' + str(map_list[i])+ ' structureModel ' + '#1')
        command.run('qscore ' + '#1' + ' toVolume ' + '#1.1.1.4' + ' useGui false pointsPerShell 8 shellRadiusStep 0.100 maxShellRadius 2.00 referenceGaussianSigma 0.60 logDetails true outputFile ~/Desktop/DataDiscovery/tester_output' + str(i) + '.csv')
        command.run('close #1') #close all models? therefore it'll all be #1 if looping through them?

calculate_q()
