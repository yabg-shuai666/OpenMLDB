# $1 should be 1(multi dimension) or 0(one dimension)
# $2 should be regex for filter testcases
ulimit -c unlimited
mkdir -p /rambuild/rtidb/build/bin
cp build/bin/rtidb /rambuild/rtidb/build/bin
cp -rf test-common /rambuild/rtidb/
cd /rambuild/rtidb/
ln -sf /depends/thirdparty thirdparty
ln -sf /depends/thirdsrc thirdsrc
if [ -f "test-common/integrationtest/setup.sh" ]
then
    export runlist=$2
    export norunlist=$3
    sh test-common/integrationtest/runall.sh $1 $2 $3
fi
