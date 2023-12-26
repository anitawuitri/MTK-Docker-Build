source env.sh
source src/poky/oe-init-build-env
touch conf/sanity.conf
DISTRO=rity-demo MACHINE=genio-700-evk bitbake rity-demo-image