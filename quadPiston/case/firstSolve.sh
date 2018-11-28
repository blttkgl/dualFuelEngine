#!/bin/sh
#*---------------------------------*- sh -*----------------------------------*#
# =========                 |                                                 #
# \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           #
#  \\    /   O peration     | Version:  6                                     #
#   \\  /    A nd           | Mail:     stas.stasheuski@gmail.com             #
#    \\/     M anipulation  |                                                 #
#*---------------------------------------------------------------------------*#

# Скрипт для запуска расчёта

# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Копирование файлов сетки
cp -r ../mesh/constant/polyMesh constant

# Запуск расчёта
# potentialFoam
multiCompression -writep -writePhi -writedivphi | tee -a case.log

# Конвертировние и операции для просмотра решённой задачи
# foamToVTK # конвертирование в формат VTK

# Перемещение файлов расчёта в папку 1 для возможности открытия в solved.foam
mkdir -p 1
mv 0/U 1
mv 0/phi 1
mv 0/T 1
mv 0/div\(phi\) 1



# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
echo -ne '\007' # звуковой сигнал при выполнении задачи




