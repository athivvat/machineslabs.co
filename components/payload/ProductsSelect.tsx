'use client'

import React, { useEffect, useState } from 'react'
import { useField } from '@payloadcms/ui'

export function ProductsSelect({ path }: { path: string }) {
  const { value = [], setValue } = useField<string[]>({ path })
  const [products, setProducts] = useState<{ id: string; name: string }[]>([])
  const [searchQuery, setSearchQuery] = useState('')
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(false)

  useEffect(() => {
    fetch('/api/store-products')
      .then((res) => {
        if (!res.ok) throw new Error('Failed to fetch')
        return res.json()
      })
      .then((data) => {
        setProducts(data)
        setLoading(false)
      })
      .catch((err) => {
        console.error(err)
        setError(true)
        setLoading(false)
      })
  }, [])

  const handleToggle = (productId: string) => {
    const currentValue = value || []
    if (currentValue.includes(productId)) {
      setValue(currentValue.filter((id) => id !== productId))
    } else {
      setValue([...currentValue, productId])
    }
  }

  // Filter products based on search query
  const filteredProducts = products.filter((p) =>
    p.name.toLowerCase().includes(searchQuery.toLowerCase())
  )

  // Find names of currently selected products for display
  const selectedProducts = products.filter((p) => value?.includes(p.id))

  return (
    <div className="field-type select" style={{ marginBottom: '25px', fontFamily: 'inherit' }}>
      <label className="field-label" style={{ display: 'block', marginBottom: '8px', fontWeight: 'bold', fontSize: '13px' }}>
        Parts Used (Drizzle public.store_product)
      </label>
      
      {loading && <p style={{ fontSize: '12px', color: '#888' }}>Loading products from database...</p>}
      {error && <p style={{ fontSize: '12px', color: '#ff4d4d' }}>Error loading products. Ensure server/API is running.</p>}
      
      {!loading && !error && (
        <div style={{
          backgroundColor: '#111',
          border: '1px solid #333',
          borderRadius: '8px',
          padding: '12px',
          display: 'flex',
          flexDirection: 'column',
          gap: '10px'
        }}>
          
          {/* Selected Products Tags */}
          {selectedProducts.length > 0 && (
            <div style={{ display: 'flex', flexWrap: 'wrap', gap: '6px', marginBottom: '4px' }}>
              {selectedProducts.map((p) => (
                <span 
                  key={p.id} 
                  style={{
                    display: 'inline-flex',
                    alignItems: 'center',
                    gap: '6px',
                    backgroundColor: '#e05a16', // blaze-orange style
                    color: '#fff',
                    padding: '2px 8px',
                    borderRadius: '4px',
                    fontSize: '11px',
                    fontWeight: 'bold',
                    fontFamily: 'monospace'
                  }}
                >
                  {p.name}
                  <button
                    type="button"
                    onClick={() => handleToggle(p.id)}
                    style={{
                      background: 'none',
                      border: 'none',
                      color: '#fff',
                      cursor: 'pointer',
                      fontSize: '11px',
                      padding: '0 2px',
                      fontWeight: 'bold'
                    }}
                  >
                    ×
                  </button>
                </span>
              ))}
            </div>
          )}

          {/* Search Input Box */}
          <input
            type="text"
            placeholder="Search parts by name..."
            value={searchQuery}
            onChange={(e) => setSearchQuery(e.target.value)}
            style={{
              width: '100%',
              backgroundColor: '#1a1a1a',
              border: '1px solid #444',
              borderRadius: '6px',
              padding: '8px 12px',
              color: '#fff',
              fontSize: '13px',
              outline: 'none',
            }}
          />

          {/* List of Filtered Products with Checkboxes */}
          <div style={{
            maxHeight: '180px',
            overflowY: 'auto',
            border: '1px solid #222',
            borderRadius: '6px',
            backgroundColor: '#0c0c0c',
          }}>
            {filteredProducts.length === 0 ? (
              <p style={{ padding: '12px', fontSize: '12px', color: '#666', textAlign: 'center' }}>
                No parts found matching "{searchQuery}"
              </p>
            ) : (
              filteredProducts.map((p) => {
                const isChecked = value?.includes(p.id) || false
                return (
                  <label 
                    key={p.id}
                    style={{
                      display: 'flex',
                      alignItems: 'center',
                      gap: '10px',
                      padding: '8px 12px',
                      cursor: 'pointer',
                      borderBottom: '1px solid #1a1a1a',
                      userSelect: 'none',
                      fontSize: '13px',
                      color: isChecked ? '#fff' : '#aaa',
                      backgroundColor: isChecked ? '#1c1c1c' : 'transparent',
                      transition: 'background-color 0.15s ease'
                    }}
                  >
                    <input
                      type="checkbox"
                      checked={isChecked}
                      onChange={() => handleToggle(p.id)}
                      style={{
                        accentColor: '#e05a16', // blaze-orange accent
                        cursor: 'pointer'
                      }}
                    />
                    <span style={{ fontFamily: 'monospace' }}>{p.name}</span>
                  </label>
                )
              })
            )}
          </div>
          
          <div style={{ display: 'flex', justifyContent: 'space-between', fontSize: '10px', color: '#555' }}>
            <span>Showing {filteredProducts.length} of {products.length} parts</span>
          </div>

        </div>
      )}
    </div>
  )
}
