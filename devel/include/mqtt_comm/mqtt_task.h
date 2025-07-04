// Generated by gencpp from file mqtt_comm/mqtt_task.msg
// DO NOT EDIT!


#ifndef MQTT_COMM_MESSAGE_MQTT_TASK_H
#define MQTT_COMM_MESSAGE_MQTT_TASK_H


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
struct mqtt_task_
{
  typedef mqtt_task_<ContainerAllocator> Type;

  mqtt_task_()
    : msgType()
    , timestamp(0)
    , taskId()
    , pathId()
    , workIds()  {
    }
  mqtt_task_(const ContainerAllocator& _alloc)
    : msgType(_alloc)
    , timestamp(0)
    , taskId(_alloc)
    , pathId(_alloc)
    , workIds(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _msgType_type;
  _msgType_type msgType;

   typedef int64_t _timestamp_type;
  _timestamp_type timestamp;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _taskId_type;
  _taskId_type taskId;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _pathId_type;
  _pathId_type pathId;

   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _workIds_type;
  _workIds_type workIds;





  typedef boost::shared_ptr< ::mqtt_comm::mqtt_task_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mqtt_comm::mqtt_task_<ContainerAllocator> const> ConstPtr;

}; // struct mqtt_task_

typedef ::mqtt_comm::mqtt_task_<std::allocator<void> > mqtt_task;

typedef boost::shared_ptr< ::mqtt_comm::mqtt_task > mqtt_taskPtr;
typedef boost::shared_ptr< ::mqtt_comm::mqtt_task const> mqtt_taskConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mqtt_comm::mqtt_task_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mqtt_comm::mqtt_task_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mqtt_comm::mqtt_task_<ContainerAllocator1> & lhs, const ::mqtt_comm::mqtt_task_<ContainerAllocator2> & rhs)
{
  return lhs.msgType == rhs.msgType &&
    lhs.timestamp == rhs.timestamp &&
    lhs.taskId == rhs.taskId &&
    lhs.pathId == rhs.pathId &&
    lhs.workIds == rhs.workIds;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mqtt_comm::mqtt_task_<ContainerAllocator1> & lhs, const ::mqtt_comm::mqtt_task_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mqtt_comm

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mqtt_comm::mqtt_task_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mqtt_comm::mqtt_task_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mqtt_comm::mqtt_task_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mqtt_comm::mqtt_task_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mqtt_comm::mqtt_task_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mqtt_comm::mqtt_task_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mqtt_comm::mqtt_task_<ContainerAllocator> >
{
  static const char* value()
  {
    return "5572e97389f79226a529e1c9cb1b09e6";
  }

  static const char* value(const ::mqtt_comm::mqtt_task_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x5572e97389f79226ULL;
  static const uint64_t static_value2 = 0xa529e1c9cb1b09e6ULL;
};

template<class ContainerAllocator>
struct DataType< ::mqtt_comm::mqtt_task_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mqtt_comm/mqtt_task";
  }

  static const char* value(const ::mqtt_comm::mqtt_task_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mqtt_comm::mqtt_task_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string msgType\n"
"int64 timestamp\n"
"string taskId\n"
"string pathId\n"
"string workIds\n"
"\n"
"\n"
;
  }

  static const char* value(const ::mqtt_comm::mqtt_task_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mqtt_comm::mqtt_task_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.msgType);
      stream.next(m.timestamp);
      stream.next(m.taskId);
      stream.next(m.pathId);
      stream.next(m.workIds);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct mqtt_task_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mqtt_comm::mqtt_task_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mqtt_comm::mqtt_task_<ContainerAllocator>& v)
  {
    if (false || !indent.empty())
      s << std::endl;
    s << indent << "msgType: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.msgType);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "timestamp: ";
    Printer<int64_t>::stream(s, indent + "  ", v.timestamp);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "taskId: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.taskId);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "pathId: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.pathId);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "workIds: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.workIds);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MQTT_COMM_MESSAGE_MQTT_TASK_H
