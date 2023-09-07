import os

def treat_stadium_data(line):
    line = line.split(',')
    line[-1] = line[-1].replace('\n','')
    return line
    
    
with open('files/stadiums/stadiums_per_ranking.csv', 'r') as f:
    
    for line in f.readlines():
        print(treat_stadium_data(line))
    
    