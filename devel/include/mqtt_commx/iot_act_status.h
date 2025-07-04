// Generated by gencpp from file mqtt_commx/iot_act_status.msg
// DO NOT EDIT!


#ifndef MQTT_COMMX_MESSAGE_IOT_ACT_STATUS_H
#define MQTT_COMMX_MESSAGE_IOT_ACT_STATUS_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <mqtt_commx/act_status.h>

namespace mqtt_commx
{
template <class ContainerAllocator>
struct iot_act_status_
{
  typedef iot_act_status_<ContainerAllocator> Type;

  iot_act_status_()
    : all_status()
    , timestamp(0)  {
    }
  iot_act_status_(const ContainerAllocator& _alloc)
    : all_status(_alloc)
    , timestamp(0)  {
  (void)_alloc;
    }



   typedef std::vector< ::mqtt_commx::act_status_<ContainerAllocator> , typename std::allocator_traits<ContainerAllocator>::template rebind_alloc< ::mqtt_commx::act_status_<ContainerAllocator> >> _all_status_type;
  _all_status_type all_status;

   typedef int64_t _timestamp_type;
  _timestamp_type timestamp;





  typedef boost::shared_ptr< ::mqtt_commx::iot_act_status_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mqtt_commx::iot_act_status_<ContainerAllocator> const> ConstPtr;

}; // struct iot_act_status_

typedef ::mqtt_commx::iot_act_status_<std::allocator<void> > iot_act_status;

typedef boost::shared_ptr< ::mqtt_commx::iot_act_status > iot_act_statusPtr;
typedef boost::shared_ptr< ::mqtt_commx::iot_act_status const> iot_act_statusConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mqtt_commx::iot_act_status_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mqtt_commx::iot_act_status_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mqtt_commx::iot_act_status_<ContainerAllocator1> & lhs, const ::mqtt_commx::iot_act_status_<ContainerAllocator2> & rhs)
{
  return lhs.all_status == rhs.all_status &&
    lhs.timestamp == rhs.timestamp;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mqtt_commx::iot_act_status_<ContainerAllocator1> & lhs, const ::mqtt_commx::iot_act_status_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mqtt_commx

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mqtt_commx::iot_act_status_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mqtt_commx::iot_act_status_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mqtt_commx::iot_act_status_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mqtt_commx::iot_act_status_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mqtt_commx::iot_act_status_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mqtt_commx::iot_act_status_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mqtt_commx::iot_act_status_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cd9100d9e84b9bf263922df0a9c28149";
  }

  static const char* value(const ::mqtt_commx::iot_act_status_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xcd9100d9e84b9bf2ULL;
  static const uint64_t static_value2 = 0x63922df0a9c28149ULL;
};

template<class ContainerAllocator>
struct DataType< ::mqtt_commx::iot_act_status_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mqtt_commx/iot_act_status";
  }

  static const char* value(const ::mqtt_commx::iot_act_status_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mqtt_commx::iot_act_status_<ContainerAllocator> >
{
  static const char* value()
  {
    return "act_status[]  all_status\n"
"int64 timestamp\n"
"================================================================================\n"
"MSG: mqtt_commx/act_status\n"
"cmd_Header header\n"
"Point point\n"
"fault_info[]  faults\n"
"\n"
"int64 act_type\n"
"int64 chassis_total_hour\n"
"float64 distance_to_target\n"
"int64 drv_direction\n"
"bool empty\n"
"bool estop\n"
"int64 firm_error_status\n"
"int64 frame_ts\n"
"int64 gear\n"
"bool in_high_voltage    # 取车状态\n"
"bool is_charging\n"
"int64 mileage\n"
"int64 motion_mode\n"
"string navi_id\n"
"int64 operational_status\n"
"int64 platform_state\n"
"int64 soc\n"
"int64 soh\n"
"float64 speed\n"
"int64 state_flow\n"
"string sub_target\n"
"string target\n"
"string task_id\n"
"int64 task_mode\n"
"int64 task_type\n"
"int64 turn_light\n"
"int64 vehicle_error_status\n"
"string vin\n"
"\n"
"================================================================================\n"
"MSG: mqtt_commx/cmd_Header\n"
"string trace_id\n"
"string trans_id\n"
"string che_id\n"
"string timestamp\n"
"string version\n"
"================================================================================\n"
"MSG: mqtt_commx/Point\n"
"float64 x\n"
"float64 y\n"
"float64 yaw\n"
"float64 z\n"
"\n"
"================================================================================\n"
"MSG: mqtt_commx/fault_info\n"
"string desc\n"
"int64 code\n"
"int32 level\n"
;
  }

  static const char* value(const ::mqtt_commx::iot_act_status_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mqtt_commx::iot_act_status_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.all_status);
      stream.next(m.timestamp);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct iot_act_status_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mqtt_commx::iot_act_status_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mqtt_commx::iot_act_status_<ContainerAllocator>& v)
  {
    if (false || !indent.empty())
      s << std::endl;
    s << indent << "all_status: ";
    if (v.all_status.empty() || false)
      s << "[";
    for (size_t i = 0; i < v.all_status.size(); ++i)
    {
      if (false && i > 0)
        s << ", ";
      else if (!false)
        s << std::endl << indent << "  -";
      Printer< ::mqtt_commx::act_status_<ContainerAllocator> >::stream(s, false ? std::string() : indent + "    ", v.all_status[i]);
    }
    if (v.all_status.empty() || false)
      s << "]";
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "timestamp: ";
    Printer<int64_t>::stream(s, indent + "  ", v.timestamp);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MQTT_COMMX_MESSAGE_IOT_ACT_STATUS_H
