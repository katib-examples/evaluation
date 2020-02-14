alias util='kubectl get nodes --no-headers | awk '\''{print $1}'\'' | xargs -I {} sh -c '\''echo {} ; kubectl describe node {} | grep Allocated -A 5 | grep -ve Event -ve Allocated -ve percent -ve -- ; echo '\'''

for i in {1..100}
do
    echo $i
    util
    echo "Total nodes"
    kubectl get nodes | wc -l
    echo "Total trials"
    kubectl get trials -n user1 |wc -l
    echo "Total jobs"
    kubectl get jobs -n user1 |wc -l
    echo "Total Pods"
    kubectl get pods -n user1 | wc -l
    echo "Total Running pods"
    kubectl get pods --field-selector status.phase=Running -n user1 | wc -l
    echo "Total Pending pods"
    kubectl get pods --field-selector status.phase=Pending -n user1 | wc -l
    sleep 10
    echo "----------------"
    echo "\n"
    echo "\n"
    echo "\n"
done

