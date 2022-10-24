#!/bin/bash
wget https://jaspar.genereg.net/download/database/JASPAR2022.sql.gz
gunzip -c JASPAR2022.sql.gz | sqlite3 JASPAR2022.sqlite3
# manually edit SQL file and change from SQLite format
