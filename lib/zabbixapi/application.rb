module Zabbix
  class ZabbixApi
    def add_application(app_options)

      app_options_default = {
        'hostid' => nil,
        'name' => nil
      }

      application = merge_opt(app_options_default, app_options)
      message = {
        'method' => 'application.create',
        'params' => application
      }

      response = send_request(message)

      unless response.empty?
        result = response['applicationids'][0].to_i
      else
        result = nil
      end

      return result
    end

    def get_app_id(host_id, app_name)

      message = {
        'method' => 'application.get',
        'params' => {
          'filter' => {
            'name' => app_name,
            'hostid' => host_id
          }
        }
      }

      response = send_request(message)

      unless response.empty?
        result = response[0]['applicationid']
      else
        result = nil
      end

      return result
    end

  end
end
