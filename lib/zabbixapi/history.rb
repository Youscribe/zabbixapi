module Zabbix

  class ZabbixApi
    #http://www.zabbix.com/documentation/1.8/api/history/get
    def get_history(options)
      defaults = {
        'history' => [],
        'nodeids' => [],
        'hostids' => [],
        'triggerids' => [],
        'itemids' => [],
        'time_from' => 0,
        'time_till' => 10,
        'filter' => [],
        'pattern' => '',
        'startPattern' => 0,
        'excludePattern' => 0,
        'searchWildcardsEnabled' => 0,
        'output' => '',  #shorten, refer, extendoutput
        'sortfield' => '', #itemid, clock
        'sortorder' => '', # ASC, DESC
        'limit' => 10000
      }
      
      params = merge_opt(defaults, options)
      
      message = {
        'method' => 'history.get',
        'params' => {
          params
        }
      }

      response = send_request(message)

      unless ( response.empty? ) then
        result = response
      else
        result = nil
      end
      return result
    end
    
  end
end
