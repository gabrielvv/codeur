import axios from 'axios'

const getEvents = (params) => axios.get('/api/events', {
    responseType: 'json',
    params: { ...params.sort }
}).then(({
    data
}) => (data || []))

const createEvent = (event) => axios.post('/api/events', event)

export {
    getEvents,
    createEvent
}