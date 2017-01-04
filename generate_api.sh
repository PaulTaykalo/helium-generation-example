# Get helium
git clone git@github.com:stanfy/helium.git helium

# Directory where helium is located
HELIUM_DIR=./helium
#Directory with helper jars
JARS_DIR=.


CURR_DIR=`pwd`
cd $HELIUM_DIR
./gradlew :command-line:noDepsJar
cd $CURR_DIR

java -cp $HELIUM_DIR/command-line/build/libs/command-line-0.8.2-SNAPSHOT-nodeps.jar com.stanfy.helium.cli.Main \
   -o output \
   --swift-entities \
   -Fgenerate-equatables \
   -Fgenerate-random-initializers \
   -HentitiesAccessLevel=public\
   $1

java -cp $HELIUM_DIR/command-line/build/libs/command-line-0.8.2-SNAPSHOT-nodeps.jar com.stanfy.helium.cli.Main \
   -o output \
   --swift-mappings \
   -HmappingType=decodable\
   $1 
