// Generated by gencpp from file car_ctr/car_state.msg
// DO NOT EDIT!


#ifndef CAR_CTR_MESSAGE_CAR_STATE_H
#define CAR_CTR_MESSAGE_CAR_STATE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace car_ctr
{
template <class ContainerAllocator>
struct car_state_
{
  typedef car_state_<ContainerAllocator> Type;

  car_state_()
    : enable(false)
    , ctrmode(0)
    , turnmode(0)
    , speed()
    , errcode()  {
      speed.assign(0.0);

      errcode.assign(0);
  }
  car_state_(const ContainerAllocator& _alloc)
    : enable(false)
    , ctrmode(0)
    , turnmode(0)
    , speed()
    , errcode()  {
  (void)_alloc;
      speed.assign(0.0);

      errcode.assign(0);
  }



   typedef uint8_t _enable_type;
  _enable_type enable;

   typedef int32_t _ctrmode_type;
  _ctrmode_type ctrmode;

   typedef int32_t _turnmode_type;
  _turnmode_type turnmode;

   typedef boost::array<float, 4>  _speed_type;
  _speed_type speed;

   typedef boost::array<int32_t, 8>  _errcode_type;
  _errcode_type errcode;





  typedef boost::shared_ptr< ::car_ctr::car_state_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::car_ctr::car_state_<ContainerAllocator> const> ConstPtr;

}; // struct car_state_

typedef ::car_ctr::car_state_<std::allocator<void> > car_state;

typedef boost::shared_ptr< ::car_ctr::car_state > car_statePtr;
typedef boost::shared_ptr< ::car_ctr::car_state const> car_stateConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::car_ctr::car_state_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::car_ctr::car_state_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::car_ctr::car_state_<ContainerAllocator1> & lhs, const ::car_ctr::car_state_<ContainerAllocator2> & rhs)
{
  return lhs.enable == rhs.enable &&
    lhs.ctrmode == rhs.ctrmode &&
    lhs.turnmode == rhs.turnmode &&
    lhs.speed == rhs.speed &&
    lhs.errcode == rhs.errcode;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::car_ctr::car_state_<ContainerAllocator1> & lhs, const ::car_ctr::car_state_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace car_ctr

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::car_ctr::car_state_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::car_ctr::car_state_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::car_ctr::car_state_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::car_ctr::car_state_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::car_ctr::car_state_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::car_ctr::car_state_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::car_ctr::car_state_<ContainerAllocator> >
{
  static const char* value()
  {
    return "cb22e40eb79ad4fa4ade5e4b0b7218d3";
  }

  static const char* value(const ::car_ctr::car_state_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xcb22e40eb79ad4faULL;
  static const uint64_t static_value2 = 0x4ade5e4b0b7218d3ULL;
};

template<class ContainerAllocator>
struct DataType< ::car_ctr::car_state_<ContainerAllocator> >
{
  static const char* value()
  {
    return "car_ctr/car_state";
  }

  static const char* value(const ::car_ctr::car_state_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::car_ctr::car_state_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool enable\n"
"int32 ctrmode\n"
"int32 turnmode    # 0-阿克曼  1-差速模式  2-自转模式  3-横移模式  4-斜行    \n"
"float32[4] speed\n"
"int32[8] errcode\n"
;
  }

  static const char* value(const ::car_ctr::car_state_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::car_ctr::car_state_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.enable);
      stream.next(m.ctrmode);
      stream.next(m.turnmode);
      stream.next(m.speed);
      stream.next(m.errcode);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct car_state_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::car_ctr::car_state_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::car_ctr::car_state_<ContainerAllocator>& v)
  {
    if (false || !indent.empty())
      s << std::endl;
    s << indent << "enable: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.enable);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "ctrmode: ";
    Printer<int32_t>::stream(s, indent + "  ", v.ctrmode);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "turnmode: ";
    Printer<int32_t>::stream(s, indent + "  ", v.turnmode);
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "speed: ";
    if (v.speed.empty() || true)
      s << "[";
    for (size_t i = 0; i < v.speed.size(); ++i)
    {
      if (true && i > 0)
        s << ", ";
      else if (!true)
        s << std::endl << indent << "  -";
      Printer<float>::stream(s, true ? std::string() : indent + "    ", v.speed[i]);
    }
    if (v.speed.empty() || true)
      s << "]";
    if (true || !indent.empty())
      s << std::endl;
    s << indent << "errcode: ";
    if (v.errcode.empty() || true)
      s << "[";
    for (size_t i = 0; i < v.errcode.size(); ++i)
    {
      if (true && i > 0)
        s << ", ";
      else if (!true)
        s << std::endl << indent << "  -";
      Printer<int32_t>::stream(s, true ? std::string() : indent + "    ", v.errcode[i]);
    }
    if (v.errcode.empty() || true)
      s << "]";
  }
};

} // namespace message_operations
} // namespace ros

#endif // CAR_CTR_MESSAGE_CAR_STATE_H
