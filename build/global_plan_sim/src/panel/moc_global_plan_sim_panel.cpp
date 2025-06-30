/****************************************************************************
** Meta object code from reading C++ file 'global_plan_sim_panel.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../src/global_plan_sim/src/panel/global_plan_sim_panel.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'global_plan_sim_panel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.8. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_rviz_gui__Panel_Global_Plan_Sim_t {
    QByteArrayData data[9];
    char stringdata0[158];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_rviz_gui__Panel_Global_Plan_Sim_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_rviz_gui__Panel_Global_Plan_Sim_t qt_meta_stringdata_rviz_gui__Panel_Global_Plan_Sim = {
    {
QT_MOC_LITERAL(0, 0, 31), // "rviz_gui::Panel_Global_Plan_Sim"
QT_MOC_LITERAL(1, 32, 8), // "qtmrfunc"
QT_MOC_LITERAL(2, 41, 0), // ""
QT_MOC_LITERAL(3, 42, 16), // "btn_load_onclick"
QT_MOC_LITERAL(4, 59, 22), // "btn_cleartrack_onclick"
QT_MOC_LITERAL(5, 82, 16), // "btn_stop_onclick"
QT_MOC_LITERAL(6, 99, 20), // "btn_syscheck_onclick"
QT_MOC_LITERAL(7, 120, 18), // "btn_enable_onclick"
QT_MOC_LITERAL(8, 139, 18) // "btn_sample_onclick"

    },
    "rviz_gui::Panel_Global_Plan_Sim\0"
    "qtmrfunc\0\0btn_load_onclick\0"
    "btn_cleartrack_onclick\0btn_stop_onclick\0"
    "btn_syscheck_onclick\0btn_enable_onclick\0"
    "btn_sample_onclick"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_rviz_gui__Panel_Global_Plan_Sim[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   49,    2, 0x09 /* Protected */,
       3,    0,   50,    2, 0x09 /* Protected */,
       4,    0,   51,    2, 0x09 /* Protected */,
       5,    0,   52,    2, 0x09 /* Protected */,
       6,    0,   53,    2, 0x09 /* Protected */,
       7,    0,   54,    2, 0x09 /* Protected */,
       8,    0,   55,    2, 0x09 /* Protected */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void rviz_gui::Panel_Global_Plan_Sim::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Panel_Global_Plan_Sim *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->qtmrfunc(); break;
        case 1: _t->btn_load_onclick(); break;
        case 2: _t->btn_cleartrack_onclick(); break;
        case 3: _t->btn_stop_onclick(); break;
        case 4: _t->btn_syscheck_onclick(); break;
        case 5: _t->btn_enable_onclick(); break;
        case 6: _t->btn_sample_onclick(); break;
        default: ;
        }
    }
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject rviz_gui::Panel_Global_Plan_Sim::staticMetaObject = { {
    &rviz::Panel::staticMetaObject,
    qt_meta_stringdata_rviz_gui__Panel_Global_Plan_Sim.data,
    qt_meta_data_rviz_gui__Panel_Global_Plan_Sim,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *rviz_gui::Panel_Global_Plan_Sim::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *rviz_gui::Panel_Global_Plan_Sim::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_rviz_gui__Panel_Global_Plan_Sim.stringdata0))
        return static_cast<void*>(this);
    return rviz::Panel::qt_metacast(_clname);
}

int rviz_gui::Panel_Global_Plan_Sim::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = rviz::Panel::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 7;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
