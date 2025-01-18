class APIEndpoints {
  static String baseURL = 'http://127.0.0.1:8000/';
  static String login = '${baseURL}login/';
  static String register = '${baseURL}register/';
  static String logout = '${baseURL}logout/';
  static String getAllClusters = '${baseURL}clusters/';
  static String getCluster = '${baseURL}clusters/{cluster_id}';
  static String getNodesByClusterId = '${baseURL}clusters/{cluster_id}/nodes';
  static String getPodsByClusterId = '${baseURL}clusters/{cluster_id}/pods';
  static String getAllNodes = '${baseURL}nodes/';
  static String getNode = '${baseURL}nodes/{node_id}';
  static String getAllPods = '${baseURL}pods/';
  static String getPod = '${baseURL}pods/{pod_id}';
  static String getAllDailyCompute = '${baseURL}daily-compute-spend/';
  static String getClusterComputeSpend =
      '${baseURL}clusters/{cluster_id}/daily-compute-spend';
}
