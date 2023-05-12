from geopy.geocoders import Nominatim
import csv

geolocator = Nominatim(user_agent="metar-locator")

# Open input and output files
with open('W2653/Example-metars.csv', newline='') as input_file, \
     open('W2653/output.csv', mode='w', newline='') as output_file:
    # Create CSV reader and writer objects
    reader = csv.reader(input_file, delimiter=',', quotechar='"')
    writer = csv.writer(output_file, delimiter=',', quotechar='"')
    
    for i in range(6):
        next(reader)
    
    # Iterate over input rows and write output rows
    for row in reader:
        # Check if row has latitude and longitude data
        if len(row) > 4 and row[3] and row[4]:
            # Try to get location information from latitude and longitude
            try:
                location = geolocator.reverse(f"{row[3]}, {row[4]}")
                address = location.raw['address']
                # Check if location is in the US
                if address.get('country_code') == 'us':
                    # Write row with state information
                    print(address.get("Location ({row[3]}, {row[4]}) is in",address.get('state')))
                    row.append(address.get('state'))
                    writer.writerow(row)
                else:
                    print(f"Error: Location ({row[3]}, {row[4]}) is not in the US")
            except:
                print(f"Error: Unable to get location information for ({row[3]}, {row[4]})")
        else:
            print("Error: Row does not have latitude and longitude data")
