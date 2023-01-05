pipeline{
    agent any
        parameters{
             text(name: 'GitCheckOutURLs')
             text(name: 'Branches')
             }
        stages{
            stage("Clone and Checkout"){
                steps{
                    deleteDir()     
                    sh '''
                        urls=$GitCheckOutURLs
                        IFS=$'\n' GitCheckOutURLs1=($urls)
                        for urls1 in "${GitCheckOutURLs1[@]}"
                        do
                            git clone $urls1
                        done
                    '''
                }
            }
            stage("Clone and Checkout1"){
                steps{
                    sh '''
                        CheckoutBranches=$Branches
                        IFS=$'\n' CheckOutURLs1=(${CheckoutBranches//$'\n'/ })
                        IFS=$'\n' CheckOutURLs1=($CheckoutBranches)
                        for checkout1 in "${CheckOutURLs1[@]}"
                        do
                            IFS=$'\n' checkout2=(${checkout1//$'\n'/ })
                            IFS=$'=' checkout2=($checkout1)
                            cd $WORKSPACE/${checkout2[0]}
                            ${checkout2[1]}
                        done    
                    '''
                }
            }
        }
}
