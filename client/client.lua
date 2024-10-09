local ox_inventory = exports.ox_inventory

exports('openEvidencebag', function(data, slot)
    if not slot?.metadata?.identifier then
        local identifier = lib.callback.await('lachy_evidencebag:getNewIdentifier', 100, data.slot)
        ox_inventory:openInventory('stash', 'bag_'..identifier)
    else
        TriggerServerEvent('lachy_evidencebag:openEvidencebag', slot.metadata.identifier)
        ox_inventory:openInventory('stash', 'bag_'..slot.metadata.identifier)
    end
end)