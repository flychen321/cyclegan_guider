#!/bin/bash


cd ~/cf/CamStyle/data/market
rm -f bounding_box_train_camstyle
ln -s bounding_box_train_camstyle_0.1guider  bounding_box_train_camstyle >> camstyle_0.1guider_log
ls -l bounding_box_train_camstyle
ls -l bounding_box_train_camstyle >> camstyle_0.1guider_log
cd ~/cf/CamStyle
python main.py -d market --logs-dir 'logs/market-ide-camstyle_0.1guider_log' --camstyle 46
sleep 10


cd ~/cf/CamStyle/data/market
rm -f bounding_box_train_camstyle
ln -s bounding_box_train_camstyle_0.2guider  bounding_box_train_camstyle >> camstyle_0.2guider_log
ls -l bounding_box_train_camstyle
ls -l bounding_box_train_camstyle >> camstyle_0.2guider_log
cd ~/cf/CamStyle
python main.py -d market --logs-dir 'logs/market-ide-camstyle__0.2guider_log' --camstyle 46
sleep 10

for((i=1;i<=5;i++))
do
    for((j=i+1;j<=6;j++))
    do
        echo $i, $j
        cd ~/cf/CamStyle/data/market
        rm -f bounding_box_train_camstyle
        ls -l >> $i'and'$j'_log'
        ln -s $i'and'$j'_original'  bounding_box_train_camstyle >> $i'and'$j'_log'
        ls -l bounding_box_train_camstyle
        ls -l bounding_box_train_camstyle >> $i'and'$j'_log'
        cd ~/cf/CamStyle
        python main.py -d market --logs-dir 'logs/market-ide-camstyle_'$i'and'$j'_log' --camstyle 46
        sleep 10
    done
done