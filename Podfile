platform :ios, '13.0'
use_frameworks!

def common_pods

  pod 'Components/Debug', :git => 'git@github.com:goncalvesej/components.git', commit: 'a88ae558333c00be0902bba7ea0c235c7bb7c31b'  

end

def test_pods

end

target 'ADummyProject' do
    
  common_pods  

  target 'ADummyProjectTests' do
    inherit! :search_paths
    
    test_pods
  end

end
