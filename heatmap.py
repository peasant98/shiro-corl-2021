import os
import numpy as np
from pathlib import Path
import matplotlib.pyplot as plt
from tensorboard.backend.event_processing.event_accumulator import EventAccumulator
import numpy as np
from scipy.stats import kde

# Directories
HOMEDIR = 'C:/Users/eldar/Desktop/School/shiro'
LOAD_DIR = 'results'
EXPORT_DIR = 'summary'
EXTENSION = '.png'
os.chdir(HOMEDIR)
RESULTS_DIRNAME = os.path.join(HOMEDIR, LOAD_DIR)
EXPORT_PATH = os.path.join(RESULTS_DIRNAME, EXPORT_DIR)

# Figure Constants
FIGSIZE = (16, 12)
LW = 2
plt.rcParams["font.size"] = 18
plt.rcParams["font.weight"] = 'normal'
plt.rcParams["font.family"] = 'Times New Roman'



def get_eventfile_paths(dirname):
    paths = {}
    for f in Path(dirname).glob("**/events.out*"):
        relative_path = f.relative_to(dirname)
        experiment_name = relative_path.parts[0]

        keywords = experiment_name.split('-')
        env_name = keywords[0]
        experiment_name = ' '.join(keywords[1:])

        paths[(env_name, experiment_name)] = f

    return paths


def get_experiment_data():
    # Given result directory, Find all eventfiles
    paths = get_eventfile_paths(RESULTS_DIRNAME)

    # Store Experiment Data As a dict
    timesteps = None
    ExperimentData = {}

    for (env_name, experiment_name), path in paths.items():

        # Read in a tensorboard file
        event_acc = EventAccumulator(str(path), size_guidance={'scalars': 0})
        # Load Data
        event_acc.Reload()

        if env_name not in ExperimentData.keys():
            ExperimentData[env_name] = {}

        # Store Data into ExperimentData dict
        for metric in event_acc.Tags()['scalars']:
            events = event_acc.Scalars(metric)

            if timesteps is None:
                timesteps = [event.step for event in events]

            if metric not in ExperimentData[env_name].keys():
                ExperimentData[env_name][metric] = {}

            if experiment_name not in ExperimentData[env_name][metric]:
                ExperimentData[env_name][metric][experiment_name] = [event.value for event in events]

    return timesteps, ExperimentData

timesteps, ExperimentData = get_experiment_data()

x = np.array(ExperimentData['Antmaze']['agent/final_x']['none 1'])
y = np.array(ExperimentData['Antmaze']['agent/final_y']['none 1'])

data = np.vstack([x, y]).T

fig, axes = plt.subplots(ncols=6, nrows=1, figsize=(21, 5))

axes[0].set_title('Scatterplot')
axes[0].plot(x, y, 'ko')
 
nbins = 20
axes[1].set_title('Hexbin')
axes[1].hexbin(x, y, gridsize=nbins, cmap=plt.cm.BuGn_r)
 
axes[2].set_title('2D Histogram')
axes[2].hist2d(x, y, bins=nbins, cmap=plt.cm.BuGn_r)
 
k = kde.gaussian_kde(data.T)
xi, yi = np.mgrid[x.min():x.max():nbins*1j, y.min():y.max():nbins*1j]
zi = k(np.vstack([xi.flatten(), yi.flatten()]))
 
axes[3].set_title('Calculate Gaussian KDE')
axes[3].pcolormesh(xi, yi, zi.reshape(xi.shape), shading='auto', cmap=plt.cm.BuGn_r)
 
axes[4].set_title('2D Density with shading')
axes[4].pcolormesh(xi, yi, zi.reshape(xi.shape), shading='gouraud', cmap=plt.cm.BuGn_r)
 
axes[5].set_title('Contour')
axes[5].pcolormesh(xi, yi, zi.reshape(xi.shape), shading='gouraud', cmap=plt.cm.BuGn_r)
axes[5].contour(xi, yi, zi.reshape(xi.shape) )

plt.show()