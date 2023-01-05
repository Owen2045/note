

# 讀檔
```py
import pandas as pd
df = pd.read_csv('test_file.csv')
```
# 欄位搜尋

```py
# 多條件搜索
df = df[(df['land_area']<=100) & (df['land_area']>=70)] 
# 多條件搜索 分開寫
a = df['land_area']<=100 
b = df['land_area']>=70
df = df[(a & b)]
# 單筆
df = df[df['land_zone']=='商業區']
# 多筆
df = df[df['land_zone'].isin(['商業區', '道路'])]
# 多筆模糊搜索
df = df[df['land_zone'].str.startswith(tuple(['商業', '道']))]
```
# 欄位轉型態
```py
df['land_area'] = pd.to_numeric(df['land_area'], errors='coerce') # 轉數字
```
# group
```py
df_group = df.groupby(['region', 'lno'])
 # 用index取群組資料
for gp_index in list(df_group.size().index):
    group_data = df_group.get_group(gp_index)
```

# Dataframe 轉 list
```py
df_layout = df.to_dict('records') # one row = one dict        -> list
df_layout = df.to_dict('list')    # one column = one list     -> dict
df_layout = df.to_dict('index')   # one index = one dict      -> dict
# 指定欄位轉list，指定欄位須為唯一，否則重複資料會被覆蓋
df_layout = df.set_index('lno').T.to_dict('list')
df_layout =  dict([(i,[a, b, c]) for i, a, b, c in zip(df['city'], df['region'], df['land_zone'], df['owner_type'])])
```


# 轉Dataframe
```py
lbkey_data = [  
                {'lbkey': 'F_01_0419_0529-0000', 'o_regno_str': '0003,0009', 'r_regno_str': '0004000,0004000', 'priority': 60},
                {'lbkey': 'B_02_0308_0028-0810', 'r_regno_str': '0068000,0270000', 'priority': 87},
                {'lbkey': 'B_02_0308_0028-1103', 'o_regno_str': '6400,7000', 'is_mark_only': True},
                {'lbkey': 'B_02_9309_0036-0010', 'o_regno_str': '5000', 'priority':50, 'system': 2},
                {'lbkey': 'A_11_0132_0572-0000', 'o_regno_str': '5000', 'priority':50},
                {'lbkey': 'A_11_0132_0572-0000', 'o_regno_str': '4000', 'priority':50},
                {'lbkey': 'F_01_0307_0322-0006', 'o_regno_str': '0081,0010', 'r_regno_str': '0008000,0640000', 'priority': 80},
            ]
df = pd.DataFrame(lbkey_data, dtype=object) # dtype=object 為不改變資料型態

# 多欄位填滿空值
df[['o_regno_str', 'r_regno_str']] = df[['o_regno_str', 'r_regno_str']].fillna('')
# 用逗點合併欄位
df[['o_regno_str', 'r_regno_str']] = df.groupby('lbkey')[['o_regno_str', 'r_regno_str']].transform(','.join)
df['priority'] = df.groupby('lbkey')['priority'].transform(max)
df['system'] = df.groupby('lbkey')['system'].transform(max)
# 去重複
df = df.drop_duplicates(subset=['lbkey', 'o_regno_str', 'r_regno_str'], inplace=False, keep='last')
# 重設index
df = df.reset_index(drop=True)
```

# 自定義排序
```py
df = pd.DataFrame.from_dict(self.package_data_list, orient='columns', dtype=object)
list_custom = ['基隆市', '臺北市', '新北市', '桃園市', '新竹市', '新竹縣', '苗栗縣', '臺中市', '彰化縣', '南投縣', '雲林縣', '嘉義市', '嘉義縣', '臺南市', '高雄市', '屏東縣', '臺東縣', '花蓮縣', '宜蘭縣']
df['city_name'] = df['city_name'].astype('category')
df['city_name'].cat.set_categories(list_custom, inplace=True)
df.sort_values(['city_name', 'area_name'], inplace=True)
```
















