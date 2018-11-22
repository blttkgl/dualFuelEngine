#!/bin/sh
#*---------------------------------*- sh -*----------------------------------*#
# =========                 |                                                 #
# \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           #
#  \\    /   O peration     | Version:  5                                     #
#   \\  /    A nd           | Mail:     stas.stasheuski@gmail.com             #
#    \\/     M anipulation  |                                                 #
#*---------------------------------------------------------------------------*#

# Скрипт для перезапуска расчёта

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Удаление cтарых результатов расчёта
rm -r 1

# Копирование файлов начальных условий без изменений из папки Orig
# cp -r 0/Orig/*.orig 0/

# Копирование файлов сетки
cp -r ../mesh/constant/polyMesh constant

# Укрупнение сетки
# refineMesh -overwrite | tee case.log

# Запуск расчёта и запись постпроцессинга
multiCompression -writep -writePhi | tee -a case.log

# Конвертировние и операции для просмотра решённой задачи
# foamToVTK | tee -a case.log # конвертирование решенной задачи в формат VTK

# Перемещение файлов расчёта в папку 1 для возможности открытия в solved.foam
mkdir -p 1
mv 0/U 1
mv 0/p 1
mv 0/phi 1
mv 0/T 1


# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
echo -ne '\007' # звуковой сигнал при выполнении задачи




