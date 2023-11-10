# gweiland

Flutter Assignment Project - Noman khanbhai

## Project Structure
Project uses -> MVVM Architecture pattern and GetX for state management.


## Bonus Features implemented in this project.
1.Local Search -> User can search the list locally on the basis on symbol and name
2.Fiter -> User can filter the data acc. to market_cap(default), price and volume_24h,
3.Swipe to refresh -> Since the data keeps updating and changing in frequent intervals. I added a swipe to refresh feature to see latest data.

## Some key points [PLEASE NOTE]
In the "Exchanges page"
1. The main banner which shows the currency detail. It has dynamic background colors
     It shows red bkg when percent_change_24h is less than zero
     Else it shows green bkg.
2. The green and red colors in list is also based on this percent_change_24h only.
3. Not all icons were provided in figma, like selected and unselected icon for bottom navbar,
     I could have done more better with icons if proper icons were available

