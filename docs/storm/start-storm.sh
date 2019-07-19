echo "start storm nimbus"
storm nimbus &
echo "start storm health check"
storm node-health-check &
echo "start storm supervisor"
storm supervisor &
echo "start storm web ui"
storm ui &
echo "start storm log viewer"
storm logviewer &
