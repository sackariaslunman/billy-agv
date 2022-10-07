import pandas as pd
import numpy as np

def get_batch(data, k, batch_size):
    return data[k*batch_size:(k+1)*batch_size]

def get_rising_edges(data: list, step_per_rotation: int, threshold: float, time_step: float, batch_size: int):
    out_data = []
    for k in range(int(len(data)/batch_size)):
        n_batch = get_batch(data, k, batch_size)
        
        step_count = 0
        stepping = False

        for step in n_batch:
            if not stepping and step > threshold:
                stepping = True
            elif stepping and step < threshold:
                stepping = False
                step_count += 1

        W = (step_count / step_per_rotation) / (time_step * batch_size)
        out_data.append(W)
    return out_data

def five_point_stencil(data: list, time_step: float):
    f = np.concatenate((np.array([data[0], data[0]]), np.array(data), np.array([data[-1], data[-1]])))
    d_data = []
    for k in range(2, len(data)+2):
        d_k = (-f[k+2] + 8*f[k+1] - 8*f[k-1] + f[k-2])/(12*time_step)
        d_data.append(d_k)
    print(len(data), len(f), len(d_data))
    return d_data