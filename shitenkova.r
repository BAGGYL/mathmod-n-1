#54.193687, 45.183491
#��������� ��������� � ��� ������� 13 ����������� ����������� ������� � ������ 
#� 1995 �� 2015 ��� ���� ��� �������� ������� ����� �������� ���������� �� ��� ����, 
#� 13 ��������� ������������ �� ������ �� �������� �������� ���������� ��� � ������������ 
#���� 10 ��������

library(tidyverse)
library(rnoaa)
#station_data = ghcnd_stations() 
# ����� ������ ��������� �����, ����� ��������� ���� ��� � ����� � ������� ���������� 
# � ��������� ���������.
station_data = read.csv("station_data.csv")
# ����� ��������� ������ ���� �������, ������� ������ ������� ��������� � ������� �������,
# ������ ������� � ������ ������� � ������������ ��� �������.
saransk = data.frame(id = "SARANSK", latitude = 54.193687,  longitude = 45.183491)
saransk_around = meteo_nearby_stations(lat_lon_df = saransk, station_data = station_data,
                                       limit = 7, var = c("PRCP", "TAVG"), #����� - ���� ��������� �������
                                       year_min = 1995, year_max = 2015)
# saransk_around -- ��� ������ ������������ ��������� �������� �������� �������, 
# ���������� �������������� ������������, ��������������� �� �� 
# ����������� �� ���������; ������ ��������� ������� 
# ����� ������������� ������������ ���������.
saransk_id = saransk_around[["SARANSK"]][["id"]][1]
# ��� ��������� ���� ������ � ������������, ���� �� �������������, 
# ���������� ��������� �������:
all_saransk_data = meteo_tidy_ghcnd(stationid = saransk_id)
