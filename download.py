import gdown

url = 'https://drive.google.com/uc?id=1NzxOxk-ALEcV6-BeJEi_aHGsLFKF77dU'
output = 'audio.zip'
gdown.download(url, output, quiet=False)

