# Pandas

## Basic commands

## Displaying data

### Display columns

`df.columns.values`

### Display first 5 elements

`df.head()`

### Display last 5 elements

`df.tail()`

### Display data types

`df.dtypes`

### Display basic info about columns (dtypes, count non-null values)

`df_all.info()`

### Display basic statistics about columns (count, mean, std, min, max)

`df_all.describe()`

### Display unique values

`df['ColumnName'].unique()`

## Data Selection

### Select column with name

`df['Ticket']` # Select column with name Ticket

### Select first 20 rows

`df.loc[0 : 20, :]`

### Move column at first position

`col = df.pop('ColumnName')`

`df.insert(0, 'ColumnName', col)`

### Drop/Delete/Remove column

`df = df.drop(columns=['PassengerId','Name'])`

## Handle empty data

### Replace empty column with median

`df_all['ColumnName'].apply(lambda x: x.fillna(x.median()))`

### Check how many empty values has column

`df['ColumnName'].isnull().sum()`

## Handle categorical data

### Convert categorical data into numerical, starting with 1 (+1 does that), if cell doesn't contain data it pd.factorize returns -1, but with +1 it will become 0

`df['Embarked'] = pd.factorize(df['Embarked'])[0] + 1`

`codes, uniques = pd.factorize(df['Ticket'])` # return codes and uniques values

## Read/Write to file

### Read csv file as pandas dataframe (It reads the headers and adds index column)

`df = pd.read_csv('train.csv')`

### Save to csv

`df.to_csv('train_numeric.csv', header=False, index=False)`
