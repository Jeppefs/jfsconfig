#!/bin/sh

speed=$(sensors | rg fan1 | awk '{print $2}')
maxspeed=$(sensors | rg fan1 | awk '{print $10}')

let speedpercent=$speed*100/$maxspeed

echo "$speedpercent%"
