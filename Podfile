platform :ios, '13.0'
use_frameworks!

def common_pods

  pod 'Components/Debug', :git => 'git@github.com:goncalvesej/components.git', commit: '903ff700281eaafc6cc79412b47b840eeb3e3f43'
#  pod 'Components/Debug', :path => '/Users/eraldojr/Code/Motorola/Components'

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
