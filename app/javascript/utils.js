const isWithinNextXDays = (date, x) => {
    const diff = (new Date(date)).getTime() - Date.now();
    return diff > 0 && diff < x * 24 * 60 * 60 * 1000
}

export {
    isWithinNextXDays,
}