// Generated by gencpp from file mqtt_commx/charge_station_notify.msg
// DO NOT EDIT!


#ifndef MQTT_COMMX_MESSAGE_CHARGE_STATION_NOTIFY_H
#define MQTT_COMMX_MESSAGE_CHARGE_STATION_NOTIFY_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <mqtt_commx/cmd_Header.h>

namespace mqtt_commx
{
template <class ContainerAllocator>
struct charge_station_notify_
{
  typedef charge_station_notify_<ContainerAllocator> Type;

  charge_station_notify_()
    : header()
    , code(0)  {
    }
  charge_station_notify_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , code(0)  {
  (void)_alloc;
    }



   typedef  ::mqtt_commx::cmd_Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef int32_t _code_type;
  _code_type code;





  typedef boost::shared_ptr< ::mqtt_commx::charge_station_notify_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mqtt_commx::charge_station_notify_<ContainerAllocator> const> ConstPtr;

}; // struct charge_station_notify_

typedef ::mqtt_commx::charge_station_notify_<std::allocator<void> > charge_station_notify;

typedef boost::shared_ptr< ::mqtt_commx::charge_station_notify > charge_station_notifyPtr;
typedef boost::shared_ptr< ::mqtt_commx::charge_station_notify const> charge_station_notifyConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mqtt_commx::charge_station_notify_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mqtt_commx::charge_station_notify_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mqtt_commx::charge_station_notify_<ContainerAllocator1> & lhs, const ::mqtt_commx::charge_station_notify_<ContainerAllocator2> & rhs)
{
  return lhs.header == rhs.header &&
    lhs.code == rhs.code;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mqtt_commx::charge_station_notify_<ContainerAllocator1> & lhs, const ::mqtt_commx::charge_station_notify_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mqtt_commx

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mqtt_commx::charge_station_notify_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mqtt_commx::charge_station_notify_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mqtt_commx::charge_station_notify_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mqtt_commx::charge_station_notify_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mqtt_commx::charge_station_notify_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mqtt_commx::charge_station_notify_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mqtt_commx::charge_station_notify_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e6208cf7671e976e6c3061bf8dbdd136";
  }

  static const char* value(const ::mqtt_commx::charge_station_notify_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe6208cf7671e976eULL;
  static const uint64_t static_value2 = 0x6c3061bf8dbdd136ULL;
};

template<class ContainerAllocator>
struct DataType< ::mqtt_commx::charge_station_notify_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mqtt_commx/charge_station_notify";
  }

  static const char* value(const ::mqtt_commx::charge_station_notify_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mqtt_commx::charge_station_notify_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cmd_Header header\n"
"int32 code   # 1 开始充电，2 停止充电\n"
"\n"
"================================================================================\n"
"MSG: mqtt_commx/cmd_Header\n"
"string trace_id\n"
"string trans_id\n"
"string che_id\n"
"string timestamp\n"
"string version\n"
;
  }

  static const char* value(const ::mqtt_commx::charge_station_notify_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mqtt_commx::charge_station_notify_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.code);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct charge_station_notify_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mqtt_commx::charge_station_notify_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mqtt_commx::charge_station_notify_<ContainerAllocator>& v)
  {
    if (false || !indent.empty())
      s << std::endl;
    s << indent << "header: ";
    Printer< ::mqtt_commx::cmd_Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "code: ";
    Printer<int32_t>::stream(s, indent + "  ", v.code);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MQTT_COMMX_MESSAGE_CHARGE_STATION_NOTIFY_H
