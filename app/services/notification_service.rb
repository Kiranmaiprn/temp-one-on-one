class NotificationService
    def self.send_notification(member_id, payload)
        android_condition = "device_type = 'android' and employee_id =  #{member_id.to_i}"
        ios_condition = "device_type = 'ios' and employee_id = #{member_id.to_i}"
        get_tokens( android_condition, "android", payload)
        get_tokens(ios_condition, "ios", payload) 
    end

    def self.get_tokens(condition, device_type, payload)
        tokens = DeviceToken.where(condition).pluck(:token).compact
        send_notification_to_employee(tokens, device_type, payload)
    end

    def self.send_notification_to_employee(tokens, device_type, payload)
        messanger = (device_type == "android" ? PushMessanger::Android.new : PushMessanger::Ios.new)
        puts "device initialized"
        begin
            messanger.deliver("#{device_type}_app", tokens, payload)
        rescue Exception => error
            Rails.logger.debug error
        end
    end

end