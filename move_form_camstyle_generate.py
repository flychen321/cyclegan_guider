import os
import shutil
import cv2
import numpy as np
import torch

def move_cam_to_dir(src_path, dst_path):
    files = os.listdir(src_path)
    cnt = 0
    if not os.path.exists(dst_path):
        os.mkdir(dst_path)
    for file in files:
        if '1to2' in file or '2to1' in file:
            shutil.copy(os.path.join(src_path, file), os.path.join(dst_path, file))
            cnt += 1
    print('cnt = %s' % cnt)


def divided_to_dirs(src_path, dst_path, cam1, cam2):
    files = os.listdir(src_path)
    cnt = 0
    dst_path = os.path.join(dst_path, '%dand%d_original'%(cam1, cam2))
    if not os.path.exists(dst_path):
        os.mkdir(dst_path)
    for file in files:
        if '%dto%d'%(cam1, cam2) in file or '%dto%d'%(cam2, cam1) in file:
            shutil.copy(os.path.join(src_path, file), os.path.join(dst_path, file))
            cnt += 1
    print('%d and %d  cnt = %s' % (cam1, cam2, cnt))

if __name__ == '__main__':
    src_path = './data/market/bounding_box_train_camstyle_15transfer_copy'
    # dst_path = './data/market/1and2_original'
    dst_path = './data/market'
    # move_cam_to_dir(src_path, dst_path)
    for i in range(1, 6):
        for j in range(i+1, 7):
            divided_to_dirs(src_path, dst_path, i, j)