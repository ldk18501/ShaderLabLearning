#ifndef LDK_CGINC
    #define LDK_CGINC
    
    float3 TriColAmbient(float3 nDir, float3 topCol, float3 sideCol, float3 bottomCol)
    {
        float top = max(0.0, nDir.g);
        float bottom = max(0.0, -nDir.g);
        float side = 1.0 - top - bottom;
        return topCol * top + sideCol * side + bottomCol * bottom;
    }
    
    float remapSimple(float x, float t1, float t2, float s1, float s2)
    {
        return(x - t1) / (t2 - t1) * (s2 - s1) + s1;
    }
#endif