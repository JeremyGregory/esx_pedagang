ESX                = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

if Config.MaxInService ~= -1 then
  TriggerEvent('esx_service:activateService', 'pedagang', Config.MaxInService)
end

TriggerEvent('esx_phone:registerNumber', 'pedagang', _U('pedagang_customer'), true, true)
TriggerEvent('esx_society:registerSociety', 'pedagang', 'pedagang', 'society_pedagang', 'society_pedagang', 'society_pedagang', {type = 'private'})



RegisterServerEvent('esx_pedagang:getStockItem')
AddEventHandler('esx_pedagang:getStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pedagang', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text =  _U('quantity_invalid') })
    end

    TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text =  _U('you_removed') .. count .. ' ' .. item.label })

  end)

end)

RegisterServerEvent('esx_pedagang:Billing')--Not Working...
AddEventHandler('esx_pedagang:Billing', function(money, player)

  local xPlayer = ESX.GetPlayerFromId(source)
  local xTarget = ESX.GetPlayerFromId(player)
  local valor = money

    if xTarget.getMoney() >= valor then
      xTarget.removeMoney(valor)
      xPlayer.addMoney(valor)
    else
      TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text =  'O seu cliente nao tem esse dinheiro, valor: ' ..valor })
    TriggerClientEvent('mythic_notify:client:SendAlert', xTarget.source, { type = 'inform', text =  'Voce nao tem esse dinheiro, valor: ' ..valor })
    end
end)--Not Working

ESX.RegisterServerCallback('esx_pedagang:getStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pedagang', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('esx_pedagang:putStockItems')
AddEventHandler('esx_pedagang:putStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pedagang', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = _U('invalid_quantity') })
    end

    TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'success', text = _U('you_added') .. count .. ' ' .. item.label })

  end)

end)


RegisterServerEvent('esx_pedagang:getFridgeStockItem')
AddEventHandler('esx_pedagang:getFridgeStockItem', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pedagang_fridge', function(inventory)

    local item = inventory.getItem(itemName)

    if item.count >= count then
      inventory.removeItem(itemName, count)
      xPlayer.addInventoryItem(itemName, count)
    else
      TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text =  _U('quantity_invalid') })
    end

    TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text =  _U('you_removed') .. count .. ' ' .. item.label })

  end)

end)

ESX.RegisterServerCallback('esx_pedagang:getFridgeStockItems', function(source, cb)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pedagang_fridge', function(inventory)
    cb(inventory.items)
  end)

end)

RegisterServerEvent('esx_pedagang:putFridgeStockItems')
AddEventHandler('esx_pedagang:putFridgeStockItems', function(itemName, count)

  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_pedagang_fridge', function(inventory)

    local item = inventory.getItem(itemName)
    local playerItemCount = xPlayer.getInventoryItem(itemName).count

    if item.count >= 0 and count <= playerItemCount then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
    else
      TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'error', text = _U('invalid_quantity') })
    end

    TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'success', text = _U('you_added') .. count .. ' ' .. item.label })

  end)

end)


RegisterServerEvent('esx_pedagang:buyItem')
AddEventHandler('esx_pedagang:buyItem', function(itemName, price, itemLabel)

    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local limit = xPlayer.getInventoryItem(itemName).limit
    local qtty = xPlayer.getInventoryItem(itemName).count
    local societyAccount = nil

    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_pedagang', function(account)
        societyAccount = account
      end)
    
    if societyAccount ~= nil and societyAccount.money >= price then
        if qtty < limit then
            societyAccount.removeMoney(price)
            xPlayer.addInventoryItem(itemName, 1)
            TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = _U('bought') .. itemLabel })
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = _U('max_item') })
        end
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = _U('not_enough') })
    end

end)


RegisterServerEvent('esx_pedagang:craftingCoktails')
AddEventHandler('esx_pedagang:craftingCoktails', function(Value)

    local _source = source
    local escolha = Value       
		if escolha == "ayambakar" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('packaged_chicken').count
            local bethQuantity      = xPlayer.getInventoryItem('essence').count

            if alephQuantity < 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Ayam Fillet' })
            elseif bethQuantity < 1 then
              TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Minyak Goreng' })
            else
                    TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'ayam bakar' })
                    xPlayer.removeInventoryItem('essence', 1)
                    xPlayer.removeInventoryItem('packaged_chicken', 1)
                    xPlayer.addInventoryItem('ayambakar', 1)
            end
		elseif escolha == "ikanbakar" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('fish').count
            local bethQuantity      = xPlayer.getInventoryItem('essence').count

            if alephQuantity < 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'ikan' })
            elseif bethQuantity < 1 then
              TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'minyak goreng' })
            else
                    TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'ikan bakar' })
                    xPlayer.removeInventoryItem('fish', 1)
					          xPlayer.removeInventoryItem('essence', 1)
                    xPlayer.addInventoryItem('ikanbakar', 1)
            end
		elseif escolha == "sinom" then
            local xPlayer           = ESX.GetPlayerFromId(_source)

            local alephQuantity     = xPlayer.getInventoryItem('air_mineral').count
            local bethQuantity      = xPlayer.getInventoryItem('kunyit').count

            if alephQuantity < 1 then
                TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Air Mineral' })
            elseif bethQuantity < 1 then
              TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'kunyit' })
            else
                    TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'sinom' })
					          xPlayer.removeInventoryItem('air_mineral', 1)
                    xPlayer.removeInventoryItem('kunyit', 1)
                    xPlayer.addInventoryItem('sinom', 1)
            end
		else
      TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Otak Anda 404' })
		end
end)

RegisterServerEvent('esx_pedagang:shop')
AddEventHandler('esx_pedagang:shop', function(item, valor)

    local _source = source
    local xPlayer           = ESX.GetPlayerFromId(_source)
	local comida = item
	local preco = valor
	if xPlayer.getMoney() >= preco then
        xPlayer.removeMoney(preco)
        xPlayer.addInventoryItem(comida, 1)
	end
end)

ESX.RegisterServerCallback('esx_pedagang:getVaultWeapons', function(source, cb)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_pedagang', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    cb(weapons)

  end)

end)

ESX.RegisterServerCallback('esx_pedagang:addVaultWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.removeWeapon(weaponName)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_pedagang', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = weapons[i].count + 1
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 1
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_pedagang:removeVaultWeapon', function(source, cb, weaponName)

  local xPlayer = ESX.GetPlayerFromId(source)

  xPlayer.addWeapon(weaponName, 1000)

  TriggerEvent('esx_datastore:getSharedDataStore', 'society_pedagang', function(store)

    local weapons = store.get('weapons')

    if weapons == nil then
      weapons = {}
    end

    local foundWeapon = false

    for i=1, #weapons, 1 do
      if weapons[i].name == weaponName then
        weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
        foundWeapon = true
      end
    end

    if not foundWeapon then
      table.insert(weapons, {
        name  = weaponName,
        count = 0
      })
    end

     store.set('weapons', weapons)

     cb()

  end)

end)

ESX.RegisterServerCallback('esx_pedagang:getPlayerInventory', function(source, cb)

  local xPlayer    = ESX.GetPlayerFromId(source)
  local items      = xPlayer.inventory

  cb({
    items      = items
  })

end)
