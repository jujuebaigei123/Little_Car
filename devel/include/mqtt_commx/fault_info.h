// Generated by gencpp from file mqtt_commx/fault_info.msg
// DO NOT EDIT!


#ifndef MQTT_COMMX_MESSAGE_FAULT_INFO_H
#define MQTT_COMMX_MESSAGE_FAULT_INFO_H


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
struct fault_info_
{
  typedef fault_info_<ContainerAllocator> Type;

  fault_info_()
    : desc()
    , code(0)
    , level(0)  {
    }
  fault_info_(const ContainerAllocator& _alloc)
    : desc(_alloc)
    , code(0)
    , level(0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>> _desc_type;
  _desc_type desc;

   typedef int64_t _code_type;
  _code_type code;

   typedef int32_t _level_type;
  _level_type level;





  typedef boost::shared_ptr< ::mqtt_commx::fault_info_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mqtt_commx::fault_info_<ContainerAllocator> const> ConstPtr;

}; // struct fault_info_

typedef ::mqtt_commx::fault_info_<std::allocator<void> > fault_info;

typedef boost::shared_ptr< ::mqtt_commx::fault_info > fault_infoPtr;
typedef boost::shared_ptr< ::mqtt_commx::fault_info const> fault_infoConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mqtt_commx::fault_info_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mqtt_commx::fault_info_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mqtt_commx::fault_info_<ContainerAllocator1> & lhs, const ::mqtt_commx::fault_info_<ContainerAllocator2> & rhs)
{
  return lhs.desc == rhs.desc &&
    lhs.code == rhs.code &&
    lhs.level == rhs.level;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mqtt_commx::fault_info_<ContainerAllocator1> & lhs, const ::mqtt_commx::fault_info_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mqtt_commx

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mqtt_commx::fault_info_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mqtt_commx::fault_info_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mqtt_commx::fault_info_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mqtt_commx::fault_info_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mqtt_commx::fault_info_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mqtt_commx::fault_info_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mqtt_commx::fault_info_<ContainerAllocator> >
{
  static const char* value()
  {
    return "95e3250e1d1ef52a3c756cce9a37436a";
  }

  static const char* value(const ::mqtt_commx::fault_info_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x95e3250e1d1ef52aULL;
  static const uint64_t static_value2 = 0x3c756cce9a37436aULL;
};

template<class ContainerAllocator>
struct DataType< ::mqtt_commx::fault_info_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mqtt_commx/fault_info";
  }

  static const char* value(const ::mqtt_commx::fault_info_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mqtt_commx::fault_info_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string desc\n"
"int64 code\n"
"int32 level\n"
;
  }

  static const char* value(const ::mqtt_commx::fault_info_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mqtt_commx::fault_info_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.desc);
      stream.next(m.code);
      stream.next(m.level);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct fault_info_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mqtt_commx::fault_info_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mqtt_commx::fault_info_<ContainerAllocator>& v)
  {
    if (false || !indent.empty())
      s << std::endl;
    s << indent << "desc: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename std::allocator_traits<ContainerAllocator>::template rebind_alloc<char>>>::stream(s, indent + "  ", v.desc);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "code: ";
    Printer<int64_t>::stream(s, indent + "  ", v.code);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "level: ";
    Printer<int32_t>::stream(s, indent + "  ", v.level);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MQTT_COMMX_MESSAGE_FAULT_INFO_H
