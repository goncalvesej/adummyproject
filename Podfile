platform :ios, '13.0'
use_frameworks!

def common_pods

  pod 'Components/Debug', :git => 'git@github.com:goncalvesej/components.git', commit: 'ad07aa3a92c0b991bfd5145457b66a1b832e1f1c'

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
