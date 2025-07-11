// Generated by gencpp from file mqtt_commx/network_heartbeat.msg
// DO NOT EDIT!


#ifndef MQTT_COMMX_MESSAGE_NETWORK_HEARTBEAT_H
#define MQTT_COMMX_MESSAGE_NETWORK_HEARTBEAT_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace mqtt_commx
{
template <class ContainerAllocator>
struct network_heartbeat_
{
  typedef network_heartbeat_<ContainerAllocator> Type;

  network_heartbeat_()
    : status(0)  {
    }
  network_heartbeat_(const ContainerAllocator& _alloc)
    : status(0)  {
  (void)_alloc;
    }



   typedef int32_t _status_type;
  _status_type status;





  typedef boost::shared_ptr< ::mqtt_commx::network_heartbeat_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mqtt_commx::network_heartbeat_<ContainerAllocator> const> ConstPtr;

}; // struct network_heartbeat_

typedef ::mqtt_commx::network_heartbeat_<std::allocator<void> > network_heartbeat;

typedef boost::shared_ptr< ::mqtt_commx::network_heartbeat > network_heartbeatPtr;
typedef boost::shared_ptr< ::mqtt_commx::network_heartbeat const> network_heartbeatConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mqtt_commx::network_heartbeat_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mqtt_commx::network_heartbeat_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mqtt_commx::network_heartbeat_<ContainerAllocator1> & lhs, const ::mqtt_commx::network_heartbeat_<ContainerAllocator2> & rhs)
{
  return lhs.status == rhs.status;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mqtt_commx::network_heartbeat_<ContainerAllocator1> & lhs, const ::mqtt_commx::network_heartbeat_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mqtt_commx

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mqtt_commx::network_heartbeat_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mqtt_commx::network_heartbeat_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mqtt_commx::network_heartbeat_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mqtt_commx::network_heartbeat_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mqtt_commx::network_heartbeat_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mqtt_commx::network_heartbeat_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mqtt_commx::network_heartbeat_<ContainerAllocator> >
{
  static const char* value()
  {
    return "86791dcf1de997ec7de5a0de7e4dcfcc";
  }

  static const char* value(const ::mqtt_commx::network_heartbeat_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x86791dcf1de997ecULL;
  static const uint64_t static_value2 = 0x7de5a0de7e4dcfccULL;
};

template<class ContainerAllocator>
struct DataType< ::mqtt_commx::network_heartbeat_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mqtt_commx/network_heartbeat";
  }

  static const char* value(const ::mqtt_commx::network_heartbeat_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mqtt_commx::network_heartbeat_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int32 status    # 0 网络不通，1 网络通信正常\n"
;
  }

  static const char* value(const ::mqtt_commx::network_heartbeat_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mqtt_commx::network_heartbeat_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.status);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct network_heartbeat_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mqtt_commx::network_heartbeat_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mqtt_commx::network_heartbeat_<ContainerAllocator>& v)
  {
    if (false || !indent.empty())
      s << std::endl;
    s << indent << "status: ";
    Printer<int32_t>::stream(s, indent + "  ", v.status);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MQTT_COMMX_MESSAGE_NETWORK_HEARTBEAT_H
