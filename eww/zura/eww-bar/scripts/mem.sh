#!/bin/sh

mem=$(free -hw | rg Mem | cut -c 28-32)

echo $mem
