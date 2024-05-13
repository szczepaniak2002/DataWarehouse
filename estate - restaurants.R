
library(geosphere)

restaurants <- read.csv("D:/Hurtownia/geoplaces2.csv")

estate <- read.csv('D:/Hurtownia/mexico-real-estate-clean.csv')


# Zdefiniuj maksymalną odległość dla agregacji (np. 5 km)
max_distance <- 5000  # w metrach

# Przygotuj pustą ramkę danych na wyniki
average_prices <- data.frame(id_restauracji = character(),
                             mean_price = numeric())

# Iteruj przez każdą restaurację
for (i in 1:nrow(restaurants)) {
  # Wybierz współrzędne restauracji
  restaurant_coords <- c(restaurants[i, "longitude"], restaurants[i, "latitude"])
  
  # Wybierz rekordy z tabeli "estate" w pobliżu restauracji
  nearby_estates <- estate[distHaversine(restaurant_coords, cbind(estate$lon, estate$lat)) <= max_distance, ]
  
  # Sprawdź, czy są jakieś rekordy w pobliżu
  if (nrow(nearby_estates) > 0) {
    # Oblicz średnią cenę dla wybranych nieruchomości
    mean_price <- mean(nearby_estates$price, na.rm = TRUE)
    
    # Dodaj wynik do ramki danych z wynikami
    average_prices <- rbind(average_prices, data.frame(id_restauracji = restaurants[i, "placeID"],
                                                       mean_price = mean_price))
  }
}

# Wyświetl wyniki
print(average_prices)

