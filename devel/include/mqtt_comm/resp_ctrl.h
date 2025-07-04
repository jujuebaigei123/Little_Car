// Generated by gencpp from file mqtt_comm/resp_ctrl.msg
// DO NOT EDIT!


#ifndef MQTT_COMM_MESSAGE_RESP_CTRL_H
#define MQTT_COMM_MESSAGE_RESP_CTRL_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace mqtt_comm
{
template <class ContainerAllocator>
struct resp_ctrl_
{
  typedef resp_ctrl_<ContainerAllocator> Type;

  resp_ctrl_()
    : msgType()
    , agvId()
    , timestamp(0)
    , cmdId(0)
    , value(0)
    , ctrlType()  {
    }
  resp_ctrl_(const ContainerAllocator& _alloc)
    : msgType(_alloc)
    , agvId(_alloc)
    , timestamp(0)
    , cmdId(0)
    , value(0)
    , ctrlType(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _msgType_type;
  _msgType_type msgType;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _agvId_type;
  _agvId_type agvId;

   typedef int64_t _timestamp_type;
  _timestamp_type timestamp;

   typedef int32_t _cmdId_type;
  _cmdId_type cmdId;

   typedef int32_t _value_type;
  _value_type value;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _ctrlType_type;
  _ctrlType_type ctrlType;





  typedef boost::shared_ptr< ::mqtt_comm::resp_ctrl_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mqtt_comm::resp_ctrl_<ContainerAllocator> const> ConstPtr;

}; // struct resp_ctrl_

typedef ::mqtt_comm::resp_ctrl_<std::allocator<void> > resp_ctrl;

typedef boost::shared_ptr< ::mqtt_comm::resp_ctrl > resp_ctrlPtr;
typedef boost::shared_ptr< ::mqtt_comm::resp_ctrl const> resp_ctrlConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mqtt_comm::resp_ctrl_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mqtt_comm::resp_ctrl_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mqtt_comm::resp_ctrl_<ContainerAllocator1> & lhs, const ::mqtt_comm::resp_ctrl_<ContainerAllocator2> & rhs)
{
  return lhs.msgType == rhs.msgType &&
    lhs.agvId == rhs.agvId &&
    lhs.timestamp == rhs.timestamp &&
    lhs.cmdId == rhs.cmdId &&
    lhs.value == rhs.value &&
    lhs.ctrlType == rhs.ctrlType;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mqtt_comm::resp_ctrl_<ContainerAllocator1> & lhs, const ::mqtt_comm::resp_ctrl_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mqtt_comm

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mqtt_comm::resp_ctrl_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mqtt_comm::resp_ctrl_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mqtt_comm::resp_ctrl_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mqtt_comm::resp_ctrl_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mqtt_comm::resp_ctrl_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mqtt_comm::resp_ctrl_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mqtt_comm::resp_ctrl_<ContainerAllocator> >
{
  static const char* value()
  {
    return "2f21ac2d8dc240a3fa431fbec8909886";
  }

  static const char* value(const ::mqtt_comm::resp_ctrl_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x2f21ac2d8dc240a3ULL;
  static const uint64_t static_value2 = 0xfa431fbec8909886ULL;
};

template<class ContainerAllocator>
struct DataType< ::mqtt_comm::resp_ctrl_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mqtt_comm/resp_ctrl";
  }

  static const char* value(const ::mqtt_comm::resp_ctrl_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mqtt_comm::resp_ctrl_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string msgType\n"
"string agvId\n"
"int64 timestamp\n"
"int32 cmdId\n"
"int32 value\n"
"string ctrlType\n"
"\n"
"\n"
"\n"
;
  }

  static const char* value(const ::mqtt_comm::resp_ctrl_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mqtt_comm::resp_ctrl_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.msgType);
      stream.next(m.agvId);
      stream.next(m.timestamp);
      stream.next(m.cmdId);
      stream.next(m.value);
      stream.next(m.ctrlType);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct resp_ctrl_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mqtt_comm::resp_ctrl_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mqtt_comm::resp_ctrl_<ContainerAllocator>& v)
  {
    if (false || !indent.empty())
      s << std::endl;
    s << indent << "msgType: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.msgType);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "agvId: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.agvId);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "timestamp: ";
    Printer<int64_t>::stream(s, indent + "  ", v.timestamp);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "cmdId: ";
    Printer<int32_t>::stream(s, indent + "  ", v.cmdId);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "value: ";
    Printer<int32_t>::stream(s, indent + "  ", v.value);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "ctrlType: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.ctrlType);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MQTT_COMM_MESSAGE_RESP_CTRL_H
