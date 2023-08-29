import os 

from inserting_clubs import insert_clubs_db

from random import choice, randint 

def naming_countries(string):
    ''' Return the string according to the pattern '''
    
    if '_' in string: 
        string = string.split('_') 
        data = [ st.capitalize() for st in string ]
        return ' '.join(data)    
    
    return string.capitalize()
    
def formating_files_csv(lines):
    ''' Remove comas and \n and return a list with [ clubs, city ] '''
    
    line = [ i.split(',') for i in lines ]
    line = [ [i[0], i[-1].replace('\n', '')] for i in line ]
    return line

# path file -> files/${continent}/${country}/${clubs}

if __name__ == "__main__":
    club_data = []

    for continent in os.listdir('files/clubs'):
        for country in os.listdir(f'files/clubs/{continent}'):
            with open(f'files/clubs/{continent}/{country}/clubs.csv') as f:
                #print(f.readlines())
                country = naming_countries(country)
            
                dd = formating_files_csv(f.readlines())
                
                for d in dd: 
                    club = d[0]
                    c_class = choice(['A','B','C','D','E','F'])
                    club_data.append([club, country, c_class])

    insert_clubs_db(club_data) # inserting clubs