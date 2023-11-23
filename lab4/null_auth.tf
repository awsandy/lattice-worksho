resource "null_resource" "gen_cluster_auth" {
  triggers = {
    always_run = timestamp()
  }
  #depends_on = [aws_eks_cluster.cluster]
  depends_on = [module.eks]
  provisioner "local-exec" {
    on_failure  = fail
    when        = create
    interpreter = ["/bin/bash", "-c"]
    command     = <<EOT
        CLUSTER_NAME=$(echo ${var.CLUSTER1_NAME})
        echo "Cluster name = $CLUSTER_NAME"
        eksctl utils write-kubeconfig --cluster $CLUSTER_NAME
        kubectl  version --short && kubectl get nodes
     EOT
  }
}