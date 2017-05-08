   META = FindMetaTable("Player")
    
    local function ConstructSpawnTable()
        local rtab = {}
            for k,v in pairs(CurSys.GetTypesTable()) do 
                rtab[k] = 0
            end
        return rtab
    end
    
    local function _VERIFYCURRENCY(ply)
        if !ply.__CURRENCYTABLE then 
          META:LoadCurrency()
        end
    end
    
    local function _CHECKCURRENCYTYPE(typ_e)
        assert( CurrencyTypes[type_e] == true,"Currency type does not exist.")
    end
    
    end
    function META:LoadCurrency()
          local ttbl = ConstructSpawnTable()
          local uid = tostring(self:UniqueID())
          local tbl = file.Read("csys/" .. uid .. ".txt","DATA")
          local rtbl = util.JSONToTable(tbl)
          for k,v in pairs(rtbl) do 
            ttbl[k] = v
          end
        self.__CURRENCYTABLE = ttbl 
    end
        
    
    function META:SaveCurrency() 
        _VERIFYCURRENCY(self)
        local tbl = util.TableToJSON(self.__CURRENCYTABLE)
        local uid = tostring(self:UniqueID())
        file.Write("csys/" .. uid .. ".txt",tbl)
    end
    
    function META:AddCurrency(type_e,amount) 
        _CHECKCURRENCYTYPE(type_e)
        _VERIFYCURRENCY(self)
        self.__CURRENCYTABLE[typ_e] = self.__CURRENCYTABLE[typ_e] + amount
    end
    
    function META:SetCurrency(type_e,amount)
        _CHECKCURRENCYTYPE(type_e)
        self.__CURRENCYTABLE[typ_e] = amount    
    end
    function META:GetCurrency(type_e)
        _CHECKCURRENCYTYPE(type_e)
        return self.__CURRENCYTABLE[typ_e] or 0
    end