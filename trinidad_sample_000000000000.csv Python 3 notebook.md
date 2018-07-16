

```python
from azureml import Workspace

ws = Workspace()
ds = ws.datasets['trinidad_sample_000000000000.csv']
frame = ds.to_dataframe()
```

    /home/nbuser/anaconda3_23/lib/python3.4/site-packages/IPython/kernel/__main__.py:5: DtypeWarning: Columns (4,18,19,25,33) have mixed types. Specify dtype option on import or set low_memory=False.



```python
df = frame
df['device_ifa'].value_counts()
```




    00000000-0000-0000-0000-000000000000    7656
    e24e6c59-dd59-4468-9b32-5d5395dc75f6    2930
    440c367d-ceed-4663-9682-fb3d2f1e638b    2334
    9071F452-D6BD-443E-ADE3-F679A12441D9    2316
    6eba2486-216c-42e8-bf6e-cd0c02c655f4    1823
    0c788db3-45ef-473a-ba87-bd0a27561113    1623
    27e87f66-bd30-403a-8c6d-35ecb268eb6c    1541
    1943bb23-f355-433c-8521-83ce9682c60e    1344
    49371aae-fb7a-4764-9cb6-2b737d9e20ac    1077
    6077b675-1d64-4a76-8863-9a441b3e3e2b    1075
    f43f484c-6ac5-4e1c-b5b6-9125364a6737    1035
    400e46e1-588c-4201-9130-4da05397fd40     916
    aed17c22-c94a-4d0b-8b46-d307d261821a     909
    99d1b3a3-cf9e-49e1-b5ba-6e16f199db68     880
    C1F24A61-E71D-455B-AAA2-FA7D746E1032     838
    710a190a-9055-4fbc-8fa0-92c6cb87bc2b     836
    7de1d1fe-0f8d-4e99-9b7d-94410999c534     790
    7b29aed5-9df9-468c-80b0-eae9886b6b2e     764
    cd265ee5-39c0-4a39-830c-5f46ff74c217     718
    d93d9804-e9e7-4de6-93ed-7bad874628e3     693
    2b393e94-784d-4ad6-93be-eeddab23ce4a     655
    7d820b7c-c8ba-48b6-aff5-2fa781b008ce     643
    f7bd6986-ff61-4ab2-baaa-76e3e30dee29     641
    351CD7DC-2EB1-451B-91E8-B8C46E62B1C8     636
    2df3b6e9-4ff0-4af8-9a75-19cff1b4f179     631
    4d12d4ad-6f3c-4000-8bc9-171232ec83f1     619
    df813c9a-1ca7-4781-a085-0cd1a08d5490     597
    1757136c-b2a7-453a-96d9-53d48053f027     583
    22e366dc-927e-49b6-8ee3-4f594650b376     569
    86e2311b-ecbc-4afa-bfd5-ad2238b6d254     569
                                            ... 
    c0068f60-0615-4aaf-8736-84085267960d       1
    345860b1-0f54-489c-96ec-4daac417137f       1
    9e65b146-fee1-42d5-a24f-7662ee63950f       1
    7871dd12-6f64-443c-a199-f4b244121199       1
    189902fb-7017-4386-b80b-fb975d00f278       1
    f51dd2b9-6443-44c7-962a-eea62ec3f4b5       1
    c4c9edf4-75a7-464b-ac60-981ee1c9ff81       1
    af50f6de-8d9a-4eb3-910f-3a205a47c779       1
    e5526f7e-0ffc-4444-9b39-43be8e1c025b       1
    9b8f07fa-ff64-41cf-9b43-af56ce3256d3       1
    61fab7f7-e5c8-4385-9e71-83f38c613eed       1
    1c5d836d-0c89-4ddf-9d3c-f1ae52a33594       1
    5dbd37e9-5018-4b27-ac2a-239a60b78dac       1
    fb480c58-f955-4a50-ad71-d94bc2e12ed5       1
    daafbd33-1729-4d28-be2b-45c9e0c19c2f       1
    154f53bf-0730-4fe6-8205-a0a7efba69a8       1
    2cb2bd98-0e6d-4c2b-861f-1e23523077f2       1
    EDA89ADB-729D-43D5-B527-D88AD304075F       1
    67541b34-c86b-4d91-b2da-ecba10393918       1
    3cd23d77-ec65-494d-8e95-a5ae40b67029       1
    9a364b36-5030-42cf-8d37-b55bb6502c02       1
    dac0e7d4-ac90-49b1-b754-639e2ec2dcd7       1
    17cfc838-ef7e-4745-ad2e-8cd0f1ebec25       1
    d1261b7a-0639-46a6-9d51-a40e933cb153       1
    ec40dcac-8e21-4973-ab0e-fab4ee9db676       1
    2e1f9979-be59-4838-a65a-f5530f34f85f       1
    a07a589d-f8c3-4878-b955-33edc53fd564       1
    9331b556-263d-4d22-9566-1585345907c8       1
    afe70561-491e-4abf-b7fe-e8d8d6d256ce       1
    e096bf84-e978-4afd-a9cc-efe3c03677ea       1
    Name: device_ifa, dtype: int64



### Remove 000-000 ifa, so we can study the ifa that has been uniquely id.


```python
ifa = df[['device_ifa','device_model']].loc[df['device_ifa'] != '00000000-0000-0000-0000-000000000000']
ifa['device_ifa'].value_counts()
```




    e24e6c59-dd59-4468-9b32-5d5395dc75f6    2930
    440c367d-ceed-4663-9682-fb3d2f1e638b    2334
    9071F452-D6BD-443E-ADE3-F679A12441D9    2316
    6eba2486-216c-42e8-bf6e-cd0c02c655f4    1823
    0c788db3-45ef-473a-ba87-bd0a27561113    1623
    27e87f66-bd30-403a-8c6d-35ecb268eb6c    1541
    1943bb23-f355-433c-8521-83ce9682c60e    1344
    49371aae-fb7a-4764-9cb6-2b737d9e20ac    1077
    6077b675-1d64-4a76-8863-9a441b3e3e2b    1075
    f43f484c-6ac5-4e1c-b5b6-9125364a6737    1035
    400e46e1-588c-4201-9130-4da05397fd40     916
    aed17c22-c94a-4d0b-8b46-d307d261821a     909
    99d1b3a3-cf9e-49e1-b5ba-6e16f199db68     880
    C1F24A61-E71D-455B-AAA2-FA7D746E1032     838
    710a190a-9055-4fbc-8fa0-92c6cb87bc2b     836
    7de1d1fe-0f8d-4e99-9b7d-94410999c534     790
    7b29aed5-9df9-468c-80b0-eae9886b6b2e     764
    cd265ee5-39c0-4a39-830c-5f46ff74c217     718
    d93d9804-e9e7-4de6-93ed-7bad874628e3     693
    2b393e94-784d-4ad6-93be-eeddab23ce4a     655
    7d820b7c-c8ba-48b6-aff5-2fa781b008ce     643
    f7bd6986-ff61-4ab2-baaa-76e3e30dee29     641
    351CD7DC-2EB1-451B-91E8-B8C46E62B1C8     636
    2df3b6e9-4ff0-4af8-9a75-19cff1b4f179     631
    4d12d4ad-6f3c-4000-8bc9-171232ec83f1     619
    df813c9a-1ca7-4781-a085-0cd1a08d5490     597
    1757136c-b2a7-453a-96d9-53d48053f027     583
    86e2311b-ecbc-4afa-bfd5-ad2238b6d254     569
    22e366dc-927e-49b6-8ee3-4f594650b376     569
    44d6f74f-83d0-4bb3-82dc-8c2b7c39c61b     568
                                            ... 
    37688a35-9add-4139-a756-d6269835fbdc       1
    ccb9b42e-2605-4c6f-9dfb-887ea1515c56       1
    6f1f5b45-cc35-4d8a-a3f6-e03f55370d01       1
    fa76abfb-b4a4-435d-a344-d8a9eccee074       1
    6745c11d-2189-4699-b811-b1ede8950281       1
    bb53756c-d229-4905-bbb6-0f33276effea       1
    8740fa9b-efe5-4e2e-82a5-92d110da9b01       1
    9cb6fae3-0de8-4c51-a117-bbfd4add2a57       1
    B1893D84-0802-4FBE-9A7A-BC71C60FE062       1
    100a6b95-d773-4534-8bfa-90ce67dac974       1
    c8e3e7ac-5135-43d2-9a8d-6f2abfafb550       1
    b1221f49-3765-4618-8fa9-1a5b10d60ae1       1
    74660100-f917-4c90-be72-6f853eef2915       1
    e3256ec9-148b-4c64-9477-895b4a8081f6       1
    073aeb79-b35c-404d-a9d6-28b3b6e93d00       1
    01d71a22-cbf3-4872-a3ae-f603caf2815a       1
    8a9f3e42-2ae8-45ef-880f-7429e625510d       1
    c0b0bd6b-1bf8-4392-8014-ea73facd8b23       1
    f3b72a5f-64de-44af-8a69-567c742c3683       1
    4D35A8CC-DEA7-43A1-843A-2A541C3BF10C       1
    6e1286ad-fb57-4fd6-a1de-d1b16c9c1af8       1
    776b0c64-995a-4965-aa3f-280ab5fc393d       1
    065598C4-8A3D-4AD1-9941-69CFDF47584F       1
    b98134d1-8820-4cda-9efe-7873779e43ae       1
    64368656-ef5a-4046-83ce-23b220f4a29b       1
    5455559a-c2c4-4264-be3e-c035a1925577       1
    e2250939-b533-4439-b907-643e61572be6       1
    758d7641-2d98-49cc-a8e5-5512f22af3a2       1
    aeaa4bc2-0bae-48bc-ae78-de34874eca1f       1
    fa332bd8-aa8c-405f-8a66-0dcbb147e59a       1
    Name: device_ifa, dtype: int64



#### We create a new column device_count based on numbers of device_model associated with ifa


```python
ifa_model_ctn = ifa.groupby('device_ifa')['device_model'].nunique().sort_values(ascending=False).reset_index(name='device_count')
ifa_model_ctn.head()

```




<div>
<table class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>device_ifa</th>
      <th>device_count</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>F5542BB4-21AC-4406-9B19-4F7BA513F08D</td>
      <td>3</td>
    </tr>
    <tr>
      <th>1</th>
      <td>90473B91-2750-4998-A172-E43C7D1B09FF</td>
      <td>3</td>
    </tr>
    <tr>
      <th>2</th>
      <td>25c81c36-8041-4ae6-8eda-14d416761de4</td>
      <td>2</td>
    </tr>
    <tr>
      <th>3</th>
      <td>be3a9e3a-1b42-4470-9296-bda375dd0386</td>
      <td>2</td>
    </tr>
    <tr>
      <th>4</th>
      <td>d698c57c-264d-4517-8bb8-8b32424a370b</td>
      <td>2</td>
    </tr>
  </tbody>
</table>
</div>



We see that there are ifas with (&gt;1) device_model associated, we select 1 ifa and see which devices are associated with this ifa


```python
ifa.loc[ifa['device_ifa'] =='F5542BB4-21AC-4406-9B19-4F7BA513F08D'].groupby('device_model').groups.keys()
```




    dict_keys(['iPad', 'A1432', 'iPhone'])



### Problem:
We assume that, from the beginning, each <b>device_ifa</b> represents 1 unique <b>device_model</b>. Through Hypothesis Testing, we want to confirm the mean for <b>device_count</b> is ONE
 <center> H_0 = mean(device_count) = 1 </center>
 <center> H_a = mean(device_count) != 1 </center>

### One sample, two-sided testing
standard significant level <b>alpha</b> = 0.05. We calculate p-value using t-test.<br>
```python
if p-value &lt;= alpha:
    reject(H_0)  # we say the result is statistically significant. 
else:
    H_0
```


```python
from scipy import stats
stats.ttest_1samp(a = ifa_model_ctn['device_count'], 
                  popmean = 1.00000)
```




    Ttest_1sampResult(statistic=39.897538917461937, pvalue=0.0)



Since <b>(pvalue &lt; alpha) </b>, we can infer that most likely the device_ifa has &gt;1 device_model associated with it. However:
    <center> <b> Type 1 and Type 2 Error </b></center>
Anytime you reject a hypothesis there is a chance you made a mistake. This would mean you rejected a hypothesis that is true or failed to reject a hypothesis that is false.

<ol>
<li>
    <b>Type 1 Error = incorrectly rejecting the null hypothesis</b>. Researcher says there is a difference between the groups when there really isn’t. It can be thought of as a false positive study result. Type I Error is related to p-Value and alpha. You can remember this by thinking that α is the first letter of the alphabet
</li>
<li>
    <b>Type 2 Error = fail to reject null when you should have rejected the null hypothesis</b>. Researcher says there is no difference between the groups when there is a difference. It can be thought of as a false negative study result. The probability of making a Type II Error is called beta. You can remember this by thinking that β is the second letter in the greek alphabet.
</li>
</ol>

Reference: http://www.stomponstep1.com/p-value-null-hypothesis-type-1-error-statistical-significance/
