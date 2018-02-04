
# Complete the function below.

def budgetShopping(n, bundleQuantities, bundleCosts)
    # construct cost per bundle hash where value points to array index
    cpb_hash = {}
    
    bundleQuantities.each_with_index do |quantity, index|
        cost = bundleCosts[index].to_f
        cpb = quantity/cost
        cpb_hash[cpb] = index 
    end
    
    # sort hash from lowest cpb
    cpb_hash = cpb_hash.sort.to_h
    #puts "cpb:#{cpb_hash.inspect} q#{bundleQuantities} c:#{bundleCosts}"
    
    total = 0
    min_price = bundleCosts.sort.first
    while(n >= min_price) do
        cpb_hash.each do |cpb, index|
            bundle_cost = bundleCosts[index]
            #puts "index:#{index} n:#{n} CPB:#{cpb} Q:#{bundleQuantities[index]} C:#{bundle_cost}"
            next if bundle_cost > n
            bundles = n/bundle_cost
            total += bundleQuantities[index]*bundles
            n -= bundle_cost*bundles 
        end
    end
    
    total
end


