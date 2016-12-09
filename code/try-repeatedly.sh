#!/bin/bash
until make flash
do
    sleep 2;
done
