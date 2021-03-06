using System.Collections;
using System;
using System.Collections.Generic;
using UnityEngine;

public class ClockManCtrller : MonoBehaviour
{
    public long initSec = 1614911281;
    public MeshRenderer clockRenderer;
    private float m_TickDelta;
    private DateTime m_Time;

    void Start()
    {
        m_TickDelta = 0;
    }

    // Update is called once per frame
    void Update()
    {
        m_TickDelta += Time.deltaTime;
        if (m_TickDelta > 1f)
        {
            m_TickDelta -= 1f;
            initSec += 1;
            m_Time = Sec2Datetime(initSec);
            clockRenderer.material.SetFloat("_SecRotRange", m_Time.Second / 60f * 360f);
            clockRenderer.material.SetFloat("_MinRotRange", m_Time.Minute / 60f * 360f);
            clockRenderer.material.SetFloat("_HourRotRange", (m_Time.Hour % 12 + m_Time.Minute / 60f) / 12f * 360f);
        }
    }


    // 秒数转换成日期
    public static DateTime Sec2Datetime(long dtVal, int zoneOffset = 8)
    {
        DateTime dt = new DateTime(1970, 1, 1);
        dt = dt.AddSeconds(dtVal);
        dt = dt.AddHours(zoneOffset);
        return dt;
    }
}
