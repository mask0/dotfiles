##install java
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer oracle-java8-set-default

##install android-studio
sudo add-apt-repository ppa:paolorotolo/android-studio
sudo apt-get update
sudo apt-get install android-studio

##avoidance error
sudo aptitude install lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6 libc6-i386 lib32gcc1
