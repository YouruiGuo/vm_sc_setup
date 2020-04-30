import gdown

url = 'https://drive.google.com/uc?id=1jqgrjADyAyxq6WVqPuQI-zv7fNMDYfRV'
output = 'audio.zip'
gdown.download(url, output, quiet=False)

